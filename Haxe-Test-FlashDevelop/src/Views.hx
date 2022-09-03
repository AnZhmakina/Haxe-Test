package;

import feathers.controls.ScrollContainer;
import feathers.controls.Button;
import feathers.events.TriggerEvent;
import feathers.layout.ResponsiveGridLayout;
import feathers.controls.Panel;
import feathers.core.PopUpManager;
import feathers.controls.Label;
import feathers.controls.LayoutGroup;
import feathers.layout.AnchorLayout;
import feathers.layout.AnchorLayoutData;
import feathers.skins.RectangleSkin;
import openfl.display.Bitmap;
import openfl.Assets;

/**
 * ...
 * @author Anastasia Zhmakina
 */
 
 interface IView
 {
	private function createView():Void;
	private function addContainerChild(container:ScrollContainer):Void;
 }
 
 class ViewsCreator extends LayoutGroup implements IView
 {
	 private var columnCount:Int = 4;
	 private var rowCount:Int = 4;
	 
	private function createView()
	{
		var container = new ScrollContainer();
		container.setSize(Main.measurement.width, Main.measurement.height);
		var layout_ = new ResponsiveGridLayout();
		layout_.columnCount = columnCount;
		container.layout = layout_;
		addChild(container);
		
		addContainerChild(container);
	}
	
	private function addContainerChild(container:ScrollContainer){};
	
	private function addPopUpButton_triggerHandler(event:TriggerEvent):Void {
		var popUp = new Panel();
		popUp.setSize(Main.measurement.width / columnCount, Main.measurement.height / columnCount);
		popUp.layout = new AnchorLayout();
		var message = new Label();
		
		var button = cast(event.currentTarget, Button);	
		message.text = button.text;
		
		message.layoutData = AnchorLayoutData.center();
		popUp.addChild(message);

		var footer = new LayoutGroup();
		footer.variant = LayoutGroup.VARIANT_TOOL_BAR;
		popUp.footer = footer;

		var closeButton = new Button();
		closeButton.text = "Close";
		
		closeButton.addEventListener(TriggerEvent.TRIGGER, (event:TriggerEvent) -> {
			PopUpManager.removePopUp(popUp);
			removeChildren();
			var xmlContent = sys.io.File.getContent(Assets.getPath('xml/forViews.xml'));
			var xml:Xml = Xml.parse(xmlContent);
			var access = new haxe.xml.Access(xml.firstElement());
			var container = new ScrollContainer();
			container.setSize(Main.measurement.width, Main.measurement.height);
			var layout_ = new ResponsiveGridLayout();
			layout_.columnCount = columnCount;
			container.layout = layout_;
			addChild(container);
			for (cat in access.node.catsButtons.nodes.cat)
			{
				var button = new Button();
				button.text = cat.att.breed;
				button.height = Main.measurement.height / columnCount;
				
				var skin = new RectangleSkin();
				skin.fill = SolidColor(Std.parseInt(cat.att.color));
				button.backgroundSkin = skin;
				
				container.addChild(button);	
			}
			
		});
		footer.addChild(closeButton);

		PopUpManager.addPopUp(popUp, this);				
	}
 }
 
class FirstView extends ViewsCreator implements IView {
	
	private function new()
	{
		super(); 
		createView();
	}
	
	private override function addContainerChild(container:ScrollContainer)
	{			
		for (i in 0...rowCount*columnCount)
		{
			var button = new Button();
			button.text = 'First Button ${i+1}';
			button.height = Main.measurement.height / columnCount;
			button.icon = new Bitmap(Assets.getBitmapData('img/${i%columnCount+1}-circle.png'));
			button.addEventListener(TriggerEvent.TRIGGER, addPopUpButton_triggerHandler);
			container.addChild(button);	
		}
	}
}

class FirstViewCreator extends FirstView
{
	public static function create():ViewsCreator {
        return new ViewsCreator();
    }
}

class SecondView extends ViewsCreator implements IView {
	
	private function new()
	{
		super(); 
		createView();
	}
	
	private override function addContainerChild(container:ScrollContainer)
	{				
		for (i in 0...rowCount*columnCount)
		{
			var button = new Button();
			button.text = 'Second Button ${i+1}';
			button.height = Main.measurement.height / columnCount;
			button.icon = new Bitmap(Assets.getBitmapData('img/${i%columnCount+1}-circle.png'));
			button.addEventListener(TriggerEvent.TRIGGER, addPopUpButton_triggerHandler);
			container.addChild(button);	
		}
	}
}

class SecondViewCreator extends SecondView
{
	public static function create():ViewsCreator {
        return new ViewsCreator();
    }
}

class ThirdView extends ViewsCreator implements IView {
	
	private function new()
	{
		super(); 
		createView();
	}
	
	private override function addContainerChild(container:ScrollContainer)
	{				
		for (i in 0...rowCount*columnCount)
		{
			var button = new Button();
			button.text = 'Third Button ${i+1}';
			button.height = Main.measurement.height / columnCount;
			button.icon = new Bitmap(Assets.getBitmapData('img/${i%columnCount+1}-circle.png'));
			button.addEventListener(TriggerEvent.TRIGGER, addPopUpButton_triggerHandler);
			container.addChild(button);	
		}
	}
}

class ThirdViewCreator extends ThirdView
{
	public static function create():ViewsCreator {
        return new ViewsCreator();
    }
}                                                   