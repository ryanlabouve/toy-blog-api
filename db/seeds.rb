2000.times do
  Post.create(
    title: Faker::Lorem.words.join(' '),
    body: Faker::Lorem.paragraphs((4..10).to_a.sample).join("\n"),
    is_draft: false
  )
end
