class TalksController < ApplicationController
  def index
    @tags = Tag.all
  end

  def render_ted
    sort_by = params[:sort_by].to_sym rescue :views
    order_by = params[:order_by].to_sym rescue :desc
    page = params[:page] || 1
    tag_ids = params[:tag_ids]
    event_id = params[:event_id]
    search_text = params[:search_text]

    @search = Talk.search {
      fulltext search_text

      facet :tag_ids, :event_id, limit: 300
      all_of do
        with(:tag_ids, tag_ids) unless tag_ids.blank?
        with(:event_id, event_id) unless event_id.blank?
      end

      order_by sort_by, order_by
      paginate page: page, per_page: 10
    }
    @talks = @search.results

    render partial: 'talks/render_the_talks'
  end
end
