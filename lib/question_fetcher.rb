require "question_fetcher/version"
require 'pry'
require 'faraday'
require 'json'

module QuestionFetcher
  extend self

  def for_tracks(track_id)
    fetch_questions(track_id)
  end

  def create_question(data)
    post_questions(data)
  end

  def vote(data)
    post_vote(data)
  end

private

  def conn
    conn = Faraday.new(:url => base_url) do |c|
      c.use Faraday::Adapter::NetHttp
    end
  end

  def fetch_questions(track_id)
    response = conn.get do |req|
      req.url "/api/tracks/#{track_id}/questions"
    end
    response.body.empty? ? [] : JSON.parse(response.body)
  end

  def post_vote(data)
    response = conn.post do |req|
      req.url "/api/tracks/#{data[:track_id]}/questions/#{data[:question_id]}/vote"
      req.headers['Content-Type'] = 'application/json'
      req.body = {vote: { user_id: data[:user_id]}}.to_json
    end
  end

  def post_questions(data)
    response = conn.post do |req|
      req.url "/api/tracks/#{data[:track_id]}/questions"
      req.headers['Content-Type'] = 'application/json'
      req.body = {question: { user_id: data[:user_id], body: data[:body]}}.to_json
    end
    JSON.parse(response.body)
  end

  def base_url
    "http://localhost:3003"
  end
end

class InvalidCredentials < StandardError; end
