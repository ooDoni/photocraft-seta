# PhotoCraft (Seta)

O [PhotoCraft](https://github.com/storytold/photocraft) com a ferramenta **Seta Curva**
(setas curvas para thumbnails: pontos clicados na imagem, alcas de curva no ponto selecionado,
espessura e cor por ponto (degrade que segue a curva), ponta e inicio ajustaveis, linha solida,
tracejada ou pontilhada, opacidade do inicio a ponta seguindo a curva).

## Instalar / atualizar no PC

Baixe o `ATUALIZAR.bat` da [versao mais nova](../../releases/latest) e de dois cliques.
Ele baixa o `PhotoCraft-Seta.exe` e cria o atalho **PhotoCraft (Seta)** na Area de Trabalho.
Para as proximas atualizacoes e so rodar o mesmo `ATUALIZAR.bat` de novo.

## Como funciona

- `seta-curva.patch`: a ferramenta Seta, aplicada sobre o PhotoCraft
  `v0.23.1` (`45066c48292e92229ada3459a83453439514c83d`), a mesma versao oficial do ArtCraft.
- `.github/workflows/compilar.yml`: a cada mudanca aqui, o GitHub compila o PhotoCraft com a Seta
  para Windows e publica o `.exe` em Releases (a aba Actions mostra o andamento).

O PhotoCraft e licenciado sob MIT ou Apache-2.0; as mudancas deste repositorio tambem.
