require 'spec_helper'

describe QuestionFetcher do

  describe ".for_tracks" do
    context "with valid credentials" do
      it "should only return questions for the specified track_id" do
        VCR.use_cassette('.for_tracks check track_id') do
          questions = QuestionFetcher.for_tracks(2)
          expect(questions.first["question"]["track_id"]).to eq 2
          expect(questions.last["question"]["track_id"]).to eq 2
        end
      end

      # it "should return an empty array if there are no questions yet" do
      #   VCR.use_cassette('.for_tracks_no_questions') do
      #     questions = QuestionFetcher.for_tracks(5)
      #     expect(questions).to eq []
      #   end
      # end
    end
  end

  describe ".create_question" do
    context "with valid credentials" do
      it "should return the created question in json format" do
        VCR.use_cassette('.create_question check reponse') do
          data = { body: "Hello world?", user_id: 3, track_id: 2}
          question = QuestionFetcher.create_question(data)
          expect(question["question"]["body"]).to eq "Hello world?"
          expect(question["question"]["user_id"]).to eq 3
          expect(question["question"]["track_id"]).to eq 2
        end
      end
    end
  end
end

