.POSIX:

SCMI = csi -s # Scheme Interpret
PYTHON = python3
OUT = out
PORT = 8000

STAMP = $(OUT)/.stamp

all: build

build:
	$(SCMI) compile.scm

clean:
	rm -rf $(OUT)

serve: build
	cd $(OUT) && $(PYTHON) -m http.server $(PORT)

