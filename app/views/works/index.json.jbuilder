json.array!(@current_user_works) do |work|
  json.extract! work, :id
  json.title work.material.title
  json.start work.do_on
  json.end work.do_on
  json.url work_path(work)
end