# rewrote make file using CodeBlocks output
# make sure /obj or $(BUILDDIR) folder exists!


# variable for common folder, use it like $(COMMONDIR)
COMMONDIR = ../common/
# variable for windows/mac
PLATFORM = Mac
# directory for src/ folder
SRCDIR = ./src/
# directory where build files go to
BUILDDIR = obj/
# library linking flags
LIBFLAG = -framework Cocoa -framework OpenGL -lm -Wno-deprecated-declarations
# compile flags
CXXFLAG = -Wall -o2 -I$(COMMONDIR) -I$(COMMONDIR)$(PLATFORM) -DGL_GLEXT_PROTOTYPES
#compiler
CXX = clang++ -std=c++17 -stdlib=libc++
GCC = clang

# shorthand for full command
CBUILD = $(GCC) $(CXXFLAG) 
CPPBLD = $(CXX) $(CXXFLAG)

# shorthand to creating executable / linking, rmb to list out all .o
CREATE_EXEC = $(CXX)  -o output \
	$(BUILDDIR)GL_utilities.o $(BUILDDIR)LoadTGA.o $(BUILDDIR)SimpleGUI.o $(BUILDDIR)MicroGlut.o \
	$(BUILDDIR)main.o $(BUILDDIR)Camera.o $(BUILDDIR)Input.o $(BUILDDIR)ThingMailbox.o \
	$(BUILDDIR)GraphicsManager.o $(BUILDDIR)SceneManager.o $(BUILDDIR)TextureManager.o $(BUILDDIR)DrawableHelper.o $(BUILDDIR)CollisionManager.o \
	$(BUILDDIR)Scene.o $(BUILDDIR)MainScene.o \
	$(BUILDDIR)Player.o \
	$(BUILDDIR)LightBall.o \
	$(BUILDDIR)MazeWall.o \
	$(BUILDDIR)Obstacle.o \
	$(BUILDDIR)TorchLight.o \
	$(BUILDDIR)Floor.o \
	$(BUILDDIR)Goal.o \
	$(LIBFLAG)


all: common source system scenes things
	$(CREATE_EXEC)
quick: source system scenes things
	$(CREATE_EXEC)

common:
# c files here, in common/
	$(CBUILD) -c $(COMMONDIR)GL_utilities.c -o $(BUILDDIR)GL_utilities.o
	$(CBUILD) -c $(COMMONDIR)LoadTGA.c -o $(BUILDDIR)LoadTGA.o
	$(CBUILD) -c $(COMMONDIR)SimpleGUI.c -o $(BUILDDIR)SimpleGUI.o
	$(CBUILD) -c $(COMMONDIR)$(PLATFORM)/MicroGlut.m -o $(BUILDDIR)MicroGlut.o

source:
# add files here for added cpp source files
	$(CPPBLD) -c $(SRCDIR)main.cpp -o $(BUILDDIR)main.o
	$(CPPBLD) -c $(SRCDIR)util/Input.cpp -o $(BUILDDIR)Input.o
	$(CPPBLD) -c $(SRCDIR)util/Camera.cpp -o $(BUILDDIR)Camera.o

system:
	$(CPPBLD) -c $(SRCDIR)core/system/GraphicsManager.cpp -o $(BUILDDIR)GraphicsManager.o
	$(CPPBLD) -c $(SRCDIR)core/system/SceneManager.cpp -o $(BUILDDIR)SceneManager.o
	$(CPPBLD) -c $(SRCDIR)core/system/TextureManager.cpp -o $(BUILDDIR)TextureManager.o
	$(CPPBLD) -c $(SRCDIR)core/system/DrawableHelper.cpp -o $(BUILDDIR)DrawableHelper.o
	$(CPPBLD) -c $(SRCDIR)core/system/ThingMailbox.cpp -o $(BUILDDIR)ThingMailbox.o
	$(CPPBLD) -c $(SRCDIR)core/system/CollisionManager.cpp -o $(BUILDDIR)CollisionManager.o

scenes:
	$(CPPBLD) -c $(SRCDIR)core/scene/Scene.cpp -o $(BUILDDIR)Scene.o
	$(CPPBLD) -c $(SRCDIR)core/scene/MainScene.cpp -o $(BUILDDIR)MainScene.o

things:
	$(CPPBLD) -c $(SRCDIR)core/things/Player.cpp -o $(BUILDDIR)Player.o
	$(CPPBLD) -c $(SRCDIR)core/things/LightBall.cpp -o $(BUILDDIR)LightBall.o
	$(CPPBLD) -c $(SRCDIR)core/things/MazeWall.cpp -o $(BUILDDIR)MazeWall.o
	$(CPPBLD) -c $(SRCDIR)core/things/Obstacle.cpp -o $(BUILDDIR)Obstacle.o
	$(CPPBLD) -c $(SRCDIR)core/things/TorchLight.cpp -o $(BUILDDIR)TorchLight.o
	$(CPPBLD) -c $(SRCDIR)core/things/Floor.cpp -o $(BUILDDIR)Floor.o
	$(CPPBLD) -c $(SRCDIR)core/things/Goal.cpp -o $(BUILDDIR)Goal.o

exec:
	$(CREATE_EXEC)

clean:
	echo "cleaning up executable and .o files" 
	rm output
	rm /Q /S *.o



# old build file from labs below
# # set this variable to the director in which you saved the common files
# commondir = ../common/

# all: main

# main : src/main.cpp $(commondir)GL_utilities.c $(commondir)LoadTGA.c $(commondir)SimpleGUI.c $(commondir)Windows/MicroGlut.c $(commondir)Windows/glew.c
# 	g++ -Wall -o project -I$(commondir) -I../common/Windows -DGL_GLEXT_PROTOTYPES src/main.cpp $(commondir)GL_utilities.c $(commondir)LoadTGA.c $(commondir)SimpleGUI.c $(commondir)Windows/MicroGlut.c $(commondir)Windows/glew.c -lopengl32 -lglu32 -lgdi32
