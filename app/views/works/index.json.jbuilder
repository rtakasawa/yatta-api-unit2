json.array!(@works_for_calendar) do |work|
  json.extract! work, :id
  json.title work.material.title
  json.start work.do_on
  json.end work.do_on
  json.url material_path(work.material)
end