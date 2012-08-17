package
{
	public class Player
	{
		public static const WIZARD : int = 1;
		public static const WARRIOR : int = 2;
		public static const CLERIC : int = 3;
		
		private var m_class : int;
		private var m_level : int;
		private var m_name : String;
		
		public function Player(a_name : String, a_class : int, a_level : int)
		{
			m_name  = a_name;
			m_class = a_class;
			m_level = a_level;
		}
		
		public function get klass() : int
		{
			return m_class;
		}
		
		public function get level() : int
		{
			return m_level;
		}
		
		public function get name() : String
		{
			return m_name;
		}
	}
}