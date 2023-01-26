# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: frueda-m <frueda-m@student.42malaga.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/26 13:58:11 by frueda-m          #+#    #+#              #
#    Updated: 2023/01/26 15:11:39 by frueda-m         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ------------------------------ Sources ------------------------------

# Files

SERVER			=		src/server.c
CLIENT			=		src/client.c
LIBFT			=		cd libft && make
LIB				=		libft/bin/libft.a

# Sources and Objects

SERVER_SRC		=		$(SERVER)
SERVER_OBJS		=		$(SERVER_SRC:.c=.o)
CLIENT_SRC		=		$(CLIENT)
CLIENT_OBJS		=		$(CLIENT_SRC:.c=.o)
OBJS			=		$(CLIENT_OBJS) $(SERVER_OBJS)

# ------------------------------ Constant strings ------------------------------

GCC			=	gcc
FLAGS		=	-Wall -Wextra -Werror
INCLUDE		=	-I include
SERVER_NAME	=	server
CLIENT_NAME	=	client
NAME		=	server

# ------------------------------ Colors ------------------------------

BOLD_PURPLE	=	\033[1;35m
BOLD_CYAN	=	\033[1;36m
BOLD_YELLOW	=	\033[1;33m
NO_COLOR	=	\033[0m

# ------------------------------ Messages ------------------------------

COMP_START	=	echo "\n🚧 $(BOLD_YELLOW)Make: $(NO_COLOR)Starting the compilation...\n"
SERV_READY	=	echo "\n📥 Server ready!\n"
CLI_READY	=	echo "\n📟 Client ready!\n"
CLEANED		=	echo "\n💧 $(BOLD_YELLOW)Clean: $(NO_COLOR)Removed all the \".o\" files \n"
FCLEANED	=	echo "\n🧼 $(BOLD_YELLOW)Fclean: $(NO_COLOR)Removed the executables \n"

# ------------------------------ Rules ------------------------------

all: $(NAME)

$(NAME): comp_start ft_server ft_client

comp_start:
		@$(COMP_START)
		@$(LIBFT)

ft_server:	$(SERVER_OBJS)
		@$(GCC) $(FLAGS) $(SERVER_OBJS) $(LIB) -o $(SERVER_NAME)
		@$(SERV_READY)

ft_client: $(CLIENT_OBJS)
		@$(GCC) $(FLAGS) $(CLIENT_OBJS) $(LIB) -o $(CLIENT_NAME)
		@$(CLI_READY)

clean:
		@rm -rf $(OBJS)
		@cd libft && make clean
		@$(CLEANED)

fclean: clean
		@rm -rf $(SERVER_NAME) $(CLIENT_NAME)
		@cd libft && make fclean
		@$(FCLEANED)

.c.o:
		@${GCC} -c ${FLAGS} $(INCLUDE) -o $@ $<

re:		fclean all

.PHONY: all clean fclean re
