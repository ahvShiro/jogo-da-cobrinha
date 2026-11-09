import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:jogo_da_cobrinha/cobra.dart';

class JogoDaCobrinha extends FlameGame {
  late Cobra player;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    player = Cobra(radius: 30, position: Vector2(0, 0));
    world.add(player);

    camera.viewport.addAll([
      _botao(
        '↑',
        const EdgeInsets.only(right: 80, bottom: 150),
        Vector2(0, -150),
      ),
      _botao(
        '↓',
        const EdgeInsets.only(right: 80, bottom: 30),
        Vector2(0, 150),
      ),
      _botao(
        '←',
        const EdgeInsets.only(right: 140, bottom: 90),
        Vector2(-150, 0),
      ),
      _botao(
        '→',
        const EdgeInsets.only(right: 20, bottom: 90),
        Vector2(150, 0),
      ),
    ]);
  }

  HudButtonComponent _botao(String texto, EdgeInsets margem, Vector2 direcao) {
    return HudButtonComponent(
      button: _visual(texto, Colors.white24),
      buttonDown: _visual(texto, Colors.white54),
      margin: margem,
      onPressed: () => handleOnPressed(direcao),
    );
  }

  void handleOnPressed(Vector2 direcao) {
    if (player.velocity + direcao == Vector2.zero()) return;
    player.velocity = direcao.clone();
  }

  PositionComponent _visual(String texto, Color cor) {
    return RectangleComponent(
      size: Vector2.all(56),
      paint: Paint()..color = cor,
      children: [
        TextComponent(
          text: texto,
          anchor: Anchor.center,
          position: Vector2.all(28),
        ),
      ],
    );
  }
}
