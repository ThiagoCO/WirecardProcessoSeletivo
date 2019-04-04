# Pedidos Moip - Processo seletivo WireCard

Aplicativo desenvolvido para o processo seletivo da Wirecard.

Desenvolvido por Thiago Cavalcante de Oliveira.


## Screenshots

<img src="https://i.ibb.co/wBLvYxY/Captura-de-Tela-2019-04-03-a-s-17-33-24.png" height="400">             <img src="https://i.ibb.co/7CS1wJG/Captura-de-Tela-2019-04-03-a-s-17-34-12.png" height="400">         <img src="https://i.ibb.co/SxChs7D/Simulator-Screen-Shot-i-Phone-8-2019-04-03-at-18-35-08.png" height="400">

Print 1 - Tela de login com textField customomizado. 

Print 2 - Lista de pedidos realizados para aquele determinado login.

Print 3 - tela de detalhes de um pedido.


## Desafio

O objetivo do teste é simular o funcionamento do modulo de pedidos do aplicativo da Wirecard, possuindo um login onde é validado o usuário e senha retornado uma chave de acesso para as demais chamadas das API`s.

## API
- Login: https://connect-sandbox.moip.com.br/oauth/token 
- Lista de pedidos:  https://sandbox.moip.com.br/v2/orders
- Detalhes do pedido:  https://sandbox.moip.com.br/v2/orders/ORDER_ID
- Documentação da API: https://dev.wirecard.com.br/reference


## Testes unitários

- Realização de todos os testes unitarios na camada viewModel
- Mocks (nas camadas de service e view)

## Ferramentas e tecnologias utilizadas

- Xcode 10
- iOS 12
- Swift 4.2
- CocoaPods
- Codable
- UserDefaults

## Arquitetura utilizada

Neste projeto estou utilizando MVVM (Model-View-ViewModel) por ser um dos melhores padrões de arquitetura para desenvolvimento iOS.

Mais informações: https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel

## Pods utilizados

#### Alamofire (https://github.com/Alamofire/Alamofire) 
Para requisições HTTP.

#### IQKeyboardManagerSwift (https://cocoapods.org/pods/IQKeyboardManagerSwift) 
Para gerenciar o uso do teclado.


## Como compilar

1. Instale o CocoaPods caso não tenha instalado: https://cocoapods.org/
2. Vá até a pasta do projeto pelo terminal (a pasta que tem o arquivo `Podfile`)
3. Digite: `pod install`
4. Pronto. Agora basta abrir o projeto no XCode pelo arquivo **`WirecardTest.xcworkspace`**

OBS: Não abra pelo **`WirecardTest.xcodeproj`** pois os pods não serão carregados e dará erro na hora de compilar.


