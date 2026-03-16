-- Lua filter to inject UEP thesis metadata as LaTeX commands
-- These are used by before-body.tex for the custom title page

function Meta(meta)
  local header_includes = meta['header-includes'] or pandoc.List()

  local function get_text(field)
    if meta[field] then
      return pandoc.utils.stringify(meta[field])
    end
    return ""
  end

  local cmds = string.format([[
\makeatletter
\newcommand{\uepTitleEN}{%s}
\newcommand{\uepThesisType}{%s}
\newcommand{\uepSupervisor}{%s}
\newcommand{\uepMajor}{%s}
%% Suppress default title
\renewcommand{\maketitle}{}
\makeatother
]], get_text('title-en'), get_text('thesis-type'), get_text('supervisor'), get_text('major'))

  header_includes:insert(pandoc.RawBlock('latex', cmds))
  meta['header-includes'] = header_includes

  return meta
end
