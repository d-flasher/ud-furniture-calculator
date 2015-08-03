package view
{
	import data.DoorMaterialData;
	import mx.events.FlexEvent;
	import spark.components.DropDownList;
	import spark.components.FormItem;
	import spark.layouts.HorizontalLayout;

	/**
	 * ...
	 * @author SitdikovDR
	 */
	public class DoorFormItem extends FormItem
	{
		private var _doorTypeMenu:DropDownList;

		public function DoorFormItem()
		{
			layout = new HorizontalLayout();

			_doorTypeMenu = new DropDownList();
			_doorTypeMenu.dataProvider = Main.DOOR_MATERIALS;
			_doorTypeMenu.requireSelection = true;
			_doorTypeMenu.percentWidth = 100;
			_doorTypeMenu.addEventListener(FlexEvent.VALUE_COMMIT, onMaterialMenuValueCommit);
			addElement(_doorTypeMenu);
		}

		private function onMaterialMenuValueCommit(event:FlexEvent):void
		{
			dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
		}

		public function get selectedDoorType():DoorMaterialData
		{
			return _doorTypeMenu.selectedItem as DoorMaterialData;
		}
	}

}