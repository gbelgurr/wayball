# Variables required during compilation
CXX = g++
CFLAGS = -Wall -g
LDFLAGS = -lglfw -lglad -lGL -lpthread -ldl
INCLUDE_PATH = ./bin/INSTALL/include
LIBRARY_PATH = ./bin/INSTALL/lib

./wayball : ball.o
	$(CXX) $(CFLAGS) -L$(LIBRARY_PATH) -o $@ $^ $(LDFLAGS)

ball.o : ball.cpp
	$(CXX) $(CFLAGS) -I$(INCLUDE_PATH) -L$(LIBRARY_PATH) -c $< $(LDFLAGS) -o $@

clean:
	rm -rf ball.o wayball

run:
	LD_LIBRARY_PATH=./bin/INSTALL/lib ./wayball
