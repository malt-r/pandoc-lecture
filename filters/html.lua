
-- remove inline slides: `[...]{.slides}` ... (Span class)
function inlineSlides(el)
    if el.classes[1] == "slides" then
        return {}
    end
end

-- remove block slides: `::: slides ... :::` ... (Div class)
function blockSlides(el)
    if el.classes[1] == "slides" then
        return {}
    end
end


-- remove inline notes span, return content: `[...]{.notes}` ... (Span class)
-- rationale: w/o this filter content would appear in generated html but not in toc
function inlineNotes(el)
    if el.classes[1] == "notes" then
        return el.content
    end
end

-- remove block notes div, return content: `::: notes ... :::` ... (Div class)
-- rationale: w/o this filter content would appear in generated html but not in toc
function blockNotes(el)
    if el.classes[1] == "notes" then
        return el.content
    end
end


return { { Span = inlineNotes, Div = blockNotes }, { Span = inlineSlides, Div = blockSlides } }
