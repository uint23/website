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
	@cd ${SOURCE} && find Images -type f ! -iname '*.psd' -print | pax -rw ../${OUT}
	@for css in ${SOURCE}/*.css; do \
		[ ! -f "$$css" ] || cp "$$css" ${OUT}/; \
	done

clean:
	rm -rf ${OUT}

.PHONY: all setup clean

