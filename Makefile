# Makefile
.PHONY: all test clean setup

GNAT = gnatmake
OBJ_DIR = obj
BIN_DIR = bin

all: setup $(BIN_DIR)/main $(BIN_DIR)/tests

setup:
	mkdir -p $(OBJ_DIR) $(BIN_DIR)

$(BIN_DIR)/main: main.adb level_set_method.adb level_set_method.ads
	$(GNAT) -P level_set.gpr main.adb

$(BIN_DIR)/tests: tests.adb level_set_method.adb level_set_method.ads
	$(GNAT) -P level_set.gpr tests.adb

test: $(BIN_DIR)/tests
	@echo "Running tests..."
	@./$(BIN_DIR)/tests

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)
