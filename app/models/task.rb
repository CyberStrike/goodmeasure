class Task < ActiveRecord::Base
	before_create :assign_position
	before_save :parse
	belongs_to :unit
	has_many :submissions, dependent: :destroy
	
	validates :title, presence: true
	validates :position, :uniqueness => {:scope => :unit}


	# Checks to see if task has a position, if not, add one
	def assign_position
   		if self.unit.tasks.nil?
     		self.position = 1    
   		else
	   		self.position = self.unit.tasks.size + 1
	   	end
 	end

 	def question
 		self.html || self.description
 	end

	def has_next?
		!unit.tasks.where("id > ?", self.id).order("id ASC").first.blank?
	end

	def has_previous?
		!unit.tasks.where("id < ?", self.id).order("id DESC").first.blank?
	end

	def next
		unit.tasks.where("id > ?", self.id).order("id ASC").first
	end
	
	def previous
		unit.tasks.where("id < ?", self.id).order("id DESC").first
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
	  pygment( markdown.render(description)).to_s)
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

## if we wanted to time up to the milisecond it would go in the task model