NAME = 

CC = cc
CFLAGS = -Wall -Wextra -Werror

RM = rm -f

SRCDIR = ./src
OBJDIR = ./build

SRCS := 
OBJS := $(addprefix $(OBJDIR)/,$(SRCS:%.c=%.o))
SRCS := $(addprefix $(SRCDIR)/,$(SRCS))

all: $(NAME)

$(NAME): $(OBJS)
	$(AR) $@ $^

$(OBJDIR)/%.o: %.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) $(INCLUDES) $< -c -o $@

clean:
	$(RM) -r $(OBJDIR)

fclean: clean
	$(RM) $(NAME) $(NAME:.a=.so)

re: fclean all

.PHONY: all clean fclean re
