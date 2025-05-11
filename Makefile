CC = gcc
CFLAGS = -Wall -Wextra -pedantic -std=c11
LDFLAGS = -lm


build:
	@echo "Building project..."
	$(CC) $(CFLAGS) -o main main.c $(LDFLAGS)
	@echo "Build complete."
	@echo "Running tests..."
	@./main
	@echo "Tests complete."
	@echo "Cleaning up..."
	@rm -f main