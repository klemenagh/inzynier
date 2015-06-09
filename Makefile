CC=clang
CFLAGS=-std=c99 -Wall -Werror -Wextra -Wformat --pedantic-errors
LDFLAGS=-lm
AXLES_SOURCES=axles.c algorithm.c functions.c structures.c ./kiss_fft/kiss_fft.c
AXLES_OBJECTS=axles.o algorithm.o functions.o structures.o kiss_fft.o
AXLES=build/axles
WATCHER_SOURCES=watcher.c
WATCHER_OBJECTS=watcher.o
WATCHER=build/watcher
all: dir axles watcher done

dir:
	mkdir -p build
	cd build
axles:
	$(CC) $(CFLAGS) -c $(AXLES_SOURCES)
	$(CC) -o $(AXLES) $(AXLES_OBJECTS) $(LDFLAGS)
watcher:
	$(CC) $(CFLAGS) -c $(WATCHER_SOURCES)
	$(CC) -o $(WATCHER) $(WATCHER_OBJECTS) $(LDFLAGS)
done:
	cd ..
	rm *.o

clean:
	rm -rf build *.o