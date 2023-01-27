/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.h                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: frueda-m <frueda-m@student.42malaga.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/09 12:29:39 by frueda-m          #+#    #+#             */
/*   Updated: 2023/01/20 15:37:07 by frueda-m         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef GET_NEXT_LINE_H
# define GET_NEXT_LINE_H

# include <stdlib.h>
# include <stddef.h> 

# ifndef BUFFER_SIZE
#  define BUFFER_SIZE 256
# endif

char	*get_next_line(int fd);
char	*ft_reader(int fd, char *buf);
char	*ft_get_extra(char *str);
char	*ft_get_line(char *str);

//Utils
void	*ft_calloc(size_t nmemb, size_t size);
char	*ft_strchr(const char *s, int c);
char	*ft_realloc(char *buf, char *line);
char	*ft_strjoin(char *buf, char *line);
size_t	ft_strlen(const char *str);

#endif