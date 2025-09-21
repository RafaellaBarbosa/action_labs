# 📱 BRL Exchange Rate - Action Labs

Aplicativo Flutter desenvolvido como parte do teste técnico da **Action Labs**.  
O app permite consultar a **taxa de câmbio do Real (BRL)** em relação a outras moedas e visualizar o histórico dos **últimos 30 dias**, incluindo a diferença percentual (`close diff`) entre os dias.

---

## ✨ Funcionalidades
- Buscar a taxa de câmbio atual entre BRL e outra moeda (USD, EUR, GBP, JPY, CAD, etc).
- Exibir a data/hora da última atualização.
- Mostrar o valor convertido em destaque.
- Expandir para visualizar o histórico dos últimos 30 dias:
  - Open, Close, High, Low.
  - Cálculo da variação percentual de fechamento (`close diff`), com cores (verde/vermelho) e ícones de tendência.

---

## 🛠️ Tecnologias
- [Flutter](https://flutter.dev/) (>=  3.35.4)
- [BLoC](https://bloclibrary.dev/) para gerenciamento de estado.
- [HTTP](https://pub.dev/packages/http) para consumo da API REST.
- [Equatable](https://pub.dev/packages/equatable) para comparação de estados.
- [flutter_svg](https://pub.dev/packages/flutter_svg) para exibição de imagens SVG.

---

## 📂 Estrutura do Projeto
```
lib/
 ├── bloc/              # Gerenciamento de estado (ExchangeCubit, States)
 ├── data/models/       # Models (ExchangeData, ExchangeHistory)
 ├── pages/             # Páginas principais (ExchangePage, HomePage)
 ├── services/          # Camada de API (ExchangeApi)
 ├── utils/             # Cores, imagens e textos
 ├── widgets/           # Widgets reutilizáveis (Header, Inputs, Cards)
 └── main.dart          # Ponto de entrada do app
```

---

## 🔑 API
- Base URL: `https://api-brl-exchange.actionlabs.com.br/api/1.0/open`
- Endpoints utilizados:
  - **Taxa atual:** `/currentExchangeRate`
  - **Histórico:** `/dailyExchangeRate`

---

## ▶️ Como rodar o projeto
1. Clone este repositório:
   ```bash
   git clone https://github.com/RafaellaBarbosa/action_labs.git
   ```
2. Entre no diretório:
   ```bash
   cd action_labs
   ```
3. Instale as dependências:
   ```bash
   flutter pub get
   ```
4. Execute o app:
   ```bash
   flutter run
   ```

---

## 📜 Licença
Este projeto foi desenvolvido exclusivamente para fins de avaliação técnica pela **Action Labs**.
