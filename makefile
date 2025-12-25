# 1. Nome do executável
TARGET = Controller_APP

# 2. Compilador
CXX = g++

# 3. Caminho para a pasta do ImGui
IMGUI_DIR = ./imgui

# 4. Arquivos Fonte (.cpp)
# Aqui listamos o seu código principal e os arquivos necessários da biblioteca ImGui
SOURCES = main.cpp \
          $(IMGUI_DIR)/imgui.cpp \
          $(IMGUI_DIR)/imgui_demo.cpp \
          $(IMGUI_DIR)/imgui_draw.cpp \
          $(IMGUI_DIR)/imgui_tables.cpp \
          $(IMGUI_DIR)/imgui_widgets.cpp \
          $(IMGUI_DIR)/backends/imgui_impl_glfw.cpp \
          $(IMGUI_DIR)/backends/imgui_impl_opengl3.cpp

# 5. Transformar arquivos .cpp em arquivos objeto .o
OBJS = $(SOURCES:.cpp=.o)

# 6. Flags de Compilação e Inclusão
# -I diz ao compilador onde procurar os arquivos .h
CXXFLAGS = -std=c++11 -I$(IMGUI_DIR) -I$(IMGUI_DIR)/backends -I. -g -Wall

# 7. Bibliotecas de Linkagem (Interface com o Ubuntu/Gráficos)
LIBS = -lglfw -lGL -ldl

# --- REGRAS DE CONSTRUÇÃO ---

all: $(TARGET)
	@echo "Construção finalizada com sucesso!"

$(TARGET): $(OBJS)
	$(CXX) -o $@ $^ $(LIBS)

# Compila cada .cpp individualmente em um .o
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

# Comando para limpar o projeto (rm -f para não dar erro se não existir arquivos)
clean:
	rm -f $(TARGET) $(OBJS)