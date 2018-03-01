CC=g++
CFLAGS=-Wall -g

all: build doczip

clean:
	-rm *.o a.exe a.out *.class html/* latex/* html/search/*

build: college.o course.o collegemain.o
	$(CC) $(CFLAGS) -o myexe college.o collegemain.o course.o

myexe: build

college.o: college.cc college.h
	$(CC) $(CFLAGS) -c college.cc

course.o: course.cc course.h
	$(CC) $(CFLAGS) -c course.cc

collegemain.o: collegemain.cc course.h node.h college.h
	$(CC) $(CFLAGS) -c collegemain.cc

doc: college.cc course.cc collegemain.cc college.h course.h node.h tarray.h
	@doxygen

html: doc

index.html: doc

doczip:
	tar -cf makedoxquiz.tar html/*