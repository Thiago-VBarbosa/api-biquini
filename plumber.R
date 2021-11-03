# plumber.R

#* @apiTitle API Biquini Cavadão
#* @apiDescription API para obter informacoes do Biquini Cavadão
#* @apiContact list(name = "Thiago V. Barbosa", url = "https://thiago-vbarbosa.netlify.app", email = "thiago.vbarbosa@hotmail.com")
#* @apiVersion 0.0.0.1000

functions <- c("functions/utils/test_option.R","functions/utils/get_query.R",
  "functions/get_shows.R","functions/get_lyrics.R","functions/get_albuns_info.R",
  "functions/get_musicas.R")

lapply(functions, FUN = source)


#* @preempt __first__
#* @get /
function(req, res) {
  res$status <- 302
  res$setHeader("Location", "./__swagger__/")
  res$body <- "Redirecting..."
  res
}

#* Retorna informações sobre os albuns do Biquini Cavadão
#* @param album Nome do Album
#* @get /albuns
function(album = ""){
  get_albuns_info(album = album)
}

#* Retorna as músicas contidas em um album específico
#* @param album O nome do album
#* @get /musicas
function(album){
  get_musicas(album = album)
}

#* Retorna informações sobre o histórico de shows do Biquini Cavadão
#* @param pais Nome do País
#* @param estado Sigla do Estado. Ex: SP ou RJ
#* @param cidade Nome da Cidade
#* @get /shows
function(pais = "", estado = "", cidade = ""){
  get_shows(pais = pais, estado = estado, cidade = cidade)
}

#* Retorna a letra de uma música de um album específico
#* @serializer html
#* @param album Nome do album que contêm a música
#* @param musica Nome da música
#* @get /letra
function(album, musica){
  get_lyrics(album = album, musica = musica)
}