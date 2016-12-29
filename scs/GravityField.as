package 
{
	public class GravityField extends BaseObject
	{
		private var activate:Boolean;
		public function GravityField() 
		{
			activate = true;
		}
		public function isActivate()
		{
			return activate;
		}
		public function reactivate(player:Player)
		{
			activate = !this.hitTestObject(player);
		}
		public function deActivate()
		{
			activate = false;
		}
	}
	
}
