test_option <- function(pais, estado, cidade){
  dplyr::case_when(
    pais == "" && estado == "" && cidade == "" ~ "nenhum",
    pais != "" && estado != "" && cidade != "" ~ "todos",
    pais != "" && estado == "" && cidade == "" ~ "p",
    pais == "" && estado != "" && cidade == "" ~ "e",
    pais == "" && estado == "" && cidade != "" ~ "c",
    pais != "" && estado != "" && cidade == "" ~ "pe",
    pais == "" && estado != "" && cidade != "" ~ "ec",
    pais != "" && estado == "" && cidade != "" ~ "pc"
  )
}