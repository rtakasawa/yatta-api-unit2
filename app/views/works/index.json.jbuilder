json.array!(@works) do |work|
  json.title work.material.title
  json.start work.do_on
  json.end work.do_on
  json.url material_path(work.material)
end