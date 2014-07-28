class Submission < ActiveRecord::Base
  before_save :parse

  default_scope { order(id: :desc) }

	belongs_to :user
	belongs_to :task
	has_many :comments, as: :commentable, dependent: :destroy

	validates :submission,  presence: true
	validates :correctness, inclusion: [true, false]
	validates :reviewed,    inclusion: [true, false]

	# validates_uniqueness_of :user, scope: [:task], message: "has already submitted."

	def is_correct?
		self.correctness
	end

	def is_incorrect?
		self.reviewed &&
		!self.correctness
	end

	def has_been_reviewed?
		self.reviewed
	end

	def is_pending_review?
		!self.reviewed
	end

	def self.distinct_users
		self.reorder("").select(:user_id).distinct.map{ |submission| submission.user }
	end

	def self.pending_review
		self.where(reviewed: false)
	end

	def self.not_accepted
		self.where(reviewed: true, correctness: false)
	end

	def self.accepted
		self.where(correctness: true)
	end

	# Returns all other submissions with matching User and Task ID's
	def related_submissions
		self.user.previous_submissions_for(self.task).includes(comments: :user)
	end

	def status
		case
		when self.is_correct? then "Accepted"
		when self.is_incorrect? then "Not Accepted"
		when self.is_pending_review? then "Pending Review"
		else
			'Unknown'
		end
	end

	def answer 
		self.html
	end

	def to_s
		"Submission"
	end

  ## Parses Markdown and adds Pygment

  protected

  def parse
    markdown = Redcarpet::Markdown.new( Redcarpet::Render::HTML.new(:hard_wrap => true),
                                        extensions = {
                                            :hard_wrap => true,
                                            :no_intra_emphasis => true,
                                            :autolink => true,
                                            :fenced_code_blocks => true })

    self.html = Redcarpet::Render::SmartyPants.render(
        pygment( markdown.render(submission)).to_s)
  end


  def pygment(markdown_body)
    require 'net/http'
    require 'uri'

    pygment_api = 'http://pygments.appspot.com/'

    doc = Nokogiri::HTML(markdown_body)
    doc.search('pre > code[class]').each do |code|
      request = Net::HTTP.post_form(
          URI.parse(pygment_api),
          { 'lang' => code[:class], 'code' => code.text.rstrip })
      code.parent.replace request.body
    end

    doc.to_s

  end

end
