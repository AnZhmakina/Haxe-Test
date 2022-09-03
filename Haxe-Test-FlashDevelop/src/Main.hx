package;

import openfl.display.Sprite;

import Views;

import feathers.controls.navigators.TabNavigator;
import feathers.controls.navigators.TabItem;
import feathers.data.ArrayCollection;
import feathers.layout.Measurements;
/**
 * ...
 * @author Anastasia Zhmakina
 */
class Main extends Sprite 
{
	public static var measurement:Measurements = new Measurements();
	public function new() 
	{
		super();
		
		var navigator = new TabNavigator();
		navigator.dataProvider = new ArrayCollection([
			TabItem.withClass("First Tab", FirstViewCreator),
			TabItem.withClass("Second Tab", SecondViewCreator),
			TabItem.withClass("Third Tab", ThirdViewCreator)
		]);	
		
		measurement.height = this.stage.stageHeight-30;
		measurement.width = this.stage.stageWidth;
		
		addChild(navigator);
	}	
}
