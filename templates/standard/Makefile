NAME = a.out

CC = cc
CFLAGS = -Wall -Wextra -Werror

RM = rm -f

SRCDIR = ./src
OBJDIR = ./build

SRCS := main.c
OBJS := $(addprefix $(OBJDIR)/,$(SRCS:%.c=%.o))
SRCS := $(addprefix $(SRCDIR)/,$(SRCS))

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $^ -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) $< -c -o $@

clean:
	$(RM) -r $(OBJDIR)

fclean: clean
	$(RM) $(NAME) $(NAME:.a=.so)

re: fclean all

.PHONY: all clean fclean re
