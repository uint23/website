TEMPLATE = Template.html
SOURCE = Static
OUT = Out

all:
	@mkdir -p ${OUT}
	@for page in ${SOURCE}/*.html; do \
		[ -f "$$page" ] || continue; \
		name=$${page##*/}; title=$${name%.html}; \
		[ "$$title" != index ] || title=Home; \
		awk -v title="$$title" -v page="$$page" ' \
			{ gsub(/\{\{TITLE\}\}/, title); \
			  if (index($$0, "{{BODY}}")) { \
				while ((getline line < page) > 0) print line; \
				close(page); \
			  } else print; \
			}' ${TEMPLATE} > ${OUT}/"$$name" || exit 1; \
	done
	@cd ${SOURCE} && find Images -type f ! -name '*.psd' -exec sh -c ' \
		f=$$1; mkdir -p "../${OUT}/$${f%/*}" && cp "$$f" "../${OUT}/$$f" \
	' sh {} \;
	@for css in ${SOURCE}/*.css; do \
		[ ! -f "$$css" ] || cp "$$css" ${OUT}/; \
	done

clean:
	rm -rf ${OUT}

.PHONY: all setup clean

