# Top 100 Games - Desafio Banco PAN

Aplicativo para o processo de seleção do Banco PAN.

Desenvolvido por Paulo Henrique Lima Lourenço.


## Screenshots

<img src="https://i.ibb.co/wBLvYxY/Captura-de-Tela-2019-04-03-a-s-17-33-24.png" height="300"><img src="https://i.ibb.co/7CS1wJG/Captura-de-Tela-2019-04-03-a-s-17-34-12.png" height="300">
<img src="https://i.ibb.co/WDB9C60/Captura-de-Tela-2019-04-03-a-s-17-34-30.png" height="300">

Print 1 - Tela inicial + pull to refresh

Print 2 - scroll infinito

Print 3 - tela de detalhes

Print 4 - tela sobe

Print 5 - Mensagem quando está sem conexão e não há dados salvos no CoreData

Print 6 - Jogos salvos no CoreData + mensagem explicativa


## Desafio

O objetivo do teste é fazer uma lista em grid com a imagem e o nome do jogo e uma tela de detalhes com a imagem, nome do jogo, contador de canais e quantidade de visualizações.

Utilizar a API do Twitch: https://dev.twitch.tv/docs/v5/reference/games/.

### Regras
- Usar Swift 3.
- Interface desenvolvida no Storyboard, utilizando Auto Layout.
- Usar UICollectionView com no minimo 2 colunas para representar a lista dos jogos.
- Paginação na tela de lista, com endless scroll / scroll infinito.
- App Universal: Você deve desenvolver uma interface que se adapte bem em telas maiores.
- CoreData: Salve as informações dos jogos para que os usuários consigam acessar offline.
- Tratamento de falha de conexão: Avise o usuário quando o download dos jogos falhar por falta de conexão.
- Pull to refresh.

## BÔNUS: Testes unitários

Há duas funções de testes unitários. 

Uma para verificar se a API do Twitch realmente retorna o limite definido, o que é importante pois a paginação do app é baseada nisso.

A outra função é para verificar se a tela de detalhes realmente é preenchida com os dados do jogo selecionado.


## Ferramentas utilizadas

- Xcode 9.3
- Swift 3.2
- CocoaPods

## Arquitetura utilizada

Neste projeto estou utilizando MVVM (Movel-View-ViewModel) por ser um dos melhores padrões de arquitetura para desenvolvimento iOS.

Mais informações: https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel

## Pods utilizados

#### Alamofire (https://github.com/Alamofire/Alamofire)
Para requisições HTTP.

#### SDWebImage (https://github.com/rs/SDWebImage)
Para carregar imagens pelo link e gerenciamento de cache.

#### SwiftyJSON (https://github.com/SwiftyJSON/SwiftyJSON)
Para trabalhar com JSON de forma fácil e rápida (eu prefiro usar Codable em Swift 4, mas como a regra era Swift 3... :p)

#### CollectionViewGridLayout (https://github.com/Digipolitan/collection-view-grid-layout)
Para fazer grids na CollectionView que se adaptam ao tamanho da tela do device.

#### UIScrollView-InfiniteScroll (https://github.com/pronebird/UIScrollView-InfiniteScroll)
Para fazer o efeito de scroll infinito / paginação

## Como compilar

1. Instale o CocoaPods caso não tenha instalado: https://cocoapods.org/
2. Vá até a pasta do projeto pelo terminal (a pasta que tem o arquivo `Podfile`)
3. Digite: `pod install`
4. Pronto. Agora basta abrir o projeto no XCode pelo arquivo **`GamesBancoPAN.xcworkspace`**

OBS: Não abra pelo **`GamesBancoPAN.xcodeproj`** pois os pods não serão carregados e dará erro na hora de compilar.



