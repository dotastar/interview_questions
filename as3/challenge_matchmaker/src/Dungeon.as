package
{
	public class Dungeon
	{
		private var m_minLevel : int;
		private var m_requiredClasses : Array;
		private var m_partySize : int;
		
		public function Dungeon( a_minLevel : int, a_requiredClasses : Array, a_partySize : int)
		{
			m_minLevel = a_minLevel;
			m_requiredClasses = a_requiredClasses;
			m_partySize = a_partySize;
		}
		
		public function get minLevel() : int
		{
			return m_minLevel;
		}
		
		public function get requiredClasses() : Array
		{
			var theRequiredClasses:Array = m_requiredClasses;
			return theRequiredClasses;
		}
		
		public function get partySize() : int
		{
			return m_partySize;
		}
	}
}