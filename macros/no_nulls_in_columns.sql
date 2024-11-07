-- Jinja
-- Tar allt från modellen
-- Itererar genom varje kolumn och kollar om det finns null
-- FALSE terminerar for loopen efter OR
-- betyder trim av whitespaces: fattar ej helt
{% macro no_nulls_in_columns(model) %}
    SELECT * FROM {{ model }} WHERE
    {% for col in adapter.get_columns_in_relation(model) -%}
        {{ col.column }} IS NULL OR
    {% endfor %}
    FALSE
{% endmacro %}
