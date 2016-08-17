class Contributor < ActiveRecord::Base
  has_many :insights
  accepts_nested_attributes_for :insights

  def insight_title=(title)
    self.insight = Insight.find_or_create_by(title: title)
  end

  def insight_title
    self.insight.title if self.insight
  end

  def insight_contents=(insights)
    insights.each do |insight|
      if !insight.empty?
        self.insights.build(insight: insight)
      end
    end
  end

  def insight_contents
    self.insights.collect { |insight| insight.content }
  end
end
