package
{
	import data.DoorMaterialData;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mx.events.FlexEvent;
	import spark.components.Button;
	import spark.components.DropDownList;
	import spark.components.FormItem;
	import spark.layouts.HorizontalLayout;

	/**
	 * ...
	 * @author SitdikovDR
	 */
	public class DoorFormItem extends FormItem
	{
		public static const REMOVE_BUTTON_CLICK:String = "removeButtonClick";

		private var _doorTypeMenu:DropDownList;

		public function DoorFormItem()
		{
			layout = new HorizontalLayout();

			_doorTypeMenu = new DropDownList();
			_doorTypeMenu.dataProvider = Main.DOOR_TYPES;
			_doorTypeMenu.requireSelection = true;
			_doorTypeMenu.addEventListener(FlexEvent.VALUE_COMMIT, onMaterialMenuValueCommit);
			addElement(_doorTypeMenu);

			var removeDoorItemButton:Button = new Button();
			removeDoorItemButton.alpha = 0.6
			removeDoorItemButton.label = "Удалить";
			removeDoorItemButton.width = 70;
			removeDoorItemButton.addEventListener(MouseEvent.CLICK, onRemoveDoorButtonClick);
			addElement(removeDoorItemButton);
		}

		private function onMaterialMenuValueCommit(event:FlexEvent):void
		{
			dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
		}

		private function onRemoveDoorButtonClick(event:MouseEvent):void
		{
			dispatchEvent(new Event(DoorFormItem.REMOVE_BUTTON_CLICK));
		}

		public function get selectedDoorType():DoorMaterialData
		{
			return _doorTypeMenu.selectedItem as DoorMaterialData;
		}
	}

}