# Makefile for My Raspberry Pi C++ Project

# Compiler and compiler flags
CXX = g++
CXXFLAGS = -Wall -Wextra -I./include

# Directories
SRC_DIR = src
BUILD_DIR = build
BIN_DIR = $(BUILD_DIR)/bin

# Source files
SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(SRCS))
TARGET = smarthome-manager  # Change this to your program name

# Targets
all: directories $(BIN_DIR)/$(TARGET)

directories:
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(BIN_DIR)

$(BIN_DIR)/$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $^ -o $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
