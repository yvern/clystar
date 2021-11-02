struct Proc(*T, R)
  def >>(f : R -> U) forall U
    Proc(*T, U).new { |x| f.call(self.call(x)) }
  end
end

module Clystar
  extend self
  VERSION = "0.1.0"

  macro pipe(t, *fs)
    ->(x : {{ t }}) do
      {% begin %}
      {% fss = fs.size %}
      {% for i in (1..fss) %} {% if fs[fss - i].is_a? Call %} {{fs[fss - i].id}} {% elsif fs[fss - i].is_a? ProcLiteral || fs[fss - i].is_a? ProcPointer || fs[fss - i].is_a? Var %} {{fs[fss - i]}}.call {% end %} {% end %} x
      {% end %}
    end
  end

  macro juxt(t, *fs)
    ->(x : {{ t }}) do
      {% begin %}
      {
      {% for fn in fs %}
      {% if fn.is_a? Call %}
      {{fn.id}}(x),
      {% elsif fn.is_a? ProcLiteral || fn.is_a? ProcPointer || fn.is_a? Var %}
      {{fn}}.call(x),
      {% else %}
      {% raise "Error: #{fn.class_name}" %}
      {% end %}
      {% end %}
      }
      {% end %}
    end
end
end
