
import 'package:flutter/material.dart';
import 'package:toly_ui/view/debugger/debugger.dart';
import 'package:tolyui/tolyui.dart';
import 'menu_display/drop_menu.dart';
import 'menu_display/menu_item_display.dart';

class DropMenuDemo4 extends StatelessWidget {
  const DropMenuDemo4({super.key});

  @override
  Widget build(BuildContext context) {
   return SizedBox(
      width: 360,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(child: buildDisplay(Placement.topStart)),
              Expanded(child: buildDisplay(Placement.top)),
              Expanded(child: buildDisplay(Placement.topEnd)),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Expanded(child: buildDisplay(Placement.leftStart)),
              Expanded(child: buildDisplay(Placement.left)),
              Expanded(child: buildDisplay(Placement.leftEnd)),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Expanded(child: buildDisplay(Placement.rightStart)),
              Expanded(child: buildDisplay(Placement.right)),
              Expanded(child: buildDisplay(Placement.rightEnd)),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Expanded(child: buildDisplay(Placement.bottomStart)),
              Expanded(child: buildDisplay(Placement.bottom)),
              Expanded(child: buildDisplay(Placement.bottomEnd)),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDisplay(Placement placement){
    String buttonText = _nameMap[placement]!;
    return Center(
      child:
      TolyDropMenu(
          onSelect: onSelect,
          placement: placement,
          decorationConfig: DecorationConfig(isBubble: false),
          offsetCalculator: (c)=>menuOffsetCalculator(c,shift: 6),
          menuItems: [
            ActionMenu(MenuMeta(router: '01', label: '1st menu item')),
            ActionMenu(MenuMeta(router: '02', label: '2nd menu item'),enable: false),
            ActionMenu(MenuMeta(router: '03', label: '3rd menu item')),
            const DividerMenu(),
            ActionMenu(MenuMeta(router: '04', label: '4ur menu item')),
          ],
          width: 140,
          childBuilder: (_, ctrl, __) {
            return DebugDisplayButton(
              info: buttonText,
              onPressed: ctrl.open,
            );
          }),
    );
  }
  static const Map<Placement,String> _nameMap = {
    Placement.top: 'Top',
    Placement.topStart: 'TStart',
    Placement.topEnd: 'TEnd',
    Placement.bottomEnd: 'BEnd',
    Placement.bottom: 'Bottom',
    Placement.bottomStart: 'BStart',
    Placement.rightEnd: 'REnd',
    Placement.right: 'Right',
    Placement.rightStart: 'RStart',
    Placement.leftEnd: 'LEnd',
    Placement.left: 'Left',
    Placement.leftStart: 'LStart',
  };


  void onSelect (MenuMeta menu) {
    $message.success(message: '点击了 [${menu.label}] 个菜单');
  }
}
