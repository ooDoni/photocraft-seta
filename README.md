# PhotoCraft (Seta)

O [PhotoCraft](https://github.com/storytold/photocraft) com a ferramenta **Seta Curva**
(setas curvas para thumbnails: pontos clicados na imagem, espessura por ponto, ponta e inicio
ajustaveis, linha solida, tracejada ou pontilhada).

## Instalar / atualizar no PC

Baixe o `ATUALIZAR.bat` da [versao mais nova](../../releases/latest) e de dois cliques.
Ele baixa o `PhotoCraft-Seta.exe` e cria o atalho **PhotoCraft (Seta)** na Area de Trabalho.
Para as proximas atualizacoes e so rodar o mesmo `ATUALIZAR.bat` de novo.

## Como funciona

- `seta-curva.patch`: a ferramenta Seta, aplicada sobre o PhotoCraft
  `0e5254e77a5c5e35a575eec2e49e30426229e35d`.
- `.github/workflows/compilar.yml`: a cada mudanca aqui, o GitHub compila o PhotoCraft com a Seta
  para Windows e publica o `.exe` em Releases (a aba Actions mostra o andamento).

O PhotoCraft e licenciado sob MIT ou Apache-2.0; as mudancas deste repositorio tambem.
