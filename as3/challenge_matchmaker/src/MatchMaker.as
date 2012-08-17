package
{
	import flash.display.Sprite;
	
	public class MatchMaker extends Sprite
	{
		/** The queue of all players that want to play this dungeon */
		private var m_queue : Vector.<Player>;
		/** The dungeon that this match making service represents */
		private var m_dungeon : Dungeon;
		
		public function MatchMaker()
		{
			m_queue = new Vector.<Player>();
			
			//some test data
			m_dungeon = new Dungeon( 10, [Player.CLERIC, Player.WARRIOR], 5);
			
			enqueue( new Player( 'warr A', Player.WARRIOR, 8 ) );
			enqueue( new Player( 'wiz A', Player.WIZARD, 12 ) );
			enqueue( new Player( 'wiz B', Player.WIZARD, 10 ) );
			enqueue( new Player( 'wiz C', Player.WIZARD, 15 ) );
			enqueue( new Player( 'wiz D', Player.WIZARD, 15 ) );
			enqueue( new Player( 'cler A', Player.CLERIC, 10 ) );
			enqueue( new Player( 'wiz E', Player.WIZARD, 12 ) ); 
			enqueue( new Player( 'cler B', Player.CLERIC, 15 ) );
			enqueue( new Player( 'warr A', Player.WARRIOR, 12 ) );
			enqueue( new Player( 'wiz F', Player.WIZARD, 15 ) );
		}
		
		/**
		 * Adds player to the queue. Prints out an list of the first five players to queue satisfy the following:
		 *  - all players meet the minumum level req of the dungeon
		 *  - the required classes are each represented at least once in the party.
		 */ 
		public function enqueue( a_player : Player ) : void
		{
			m_queue.push(a_player);
			var validPositions:Array = getValidPlayers(m_queue);
			var validPlayers:Array = [];
			//do we have the right types
			if(validPositions.length>=m_dungeon.requiredClasses.length){
				//are there enough people
				if(m_queue.length>=m_dungeon.partySize){
					var count:int = validPositions.length;
					for(var i:int=0;i<count;i++){
						validPlayers[i] = m_queue[validPositions[i]];
						m_queue.splice(validPositions[i], 1);
					}
					
					//fill out the rest of the party
					while(validPlayers.length < m_dungeon.partySize){
						validPlayers.push(m_queue[0]);
						m_queue.splice(0, 1);
					}
				}
			}
			
			trace(validPlayers);
		}
		
		private function getValidPlayers(a_queue : Vector.<Player>):Array{
			var required:Array = m_dungeon.requiredClasses;
			var validPositions:Array = [];
			
			for(var i:int=0;i<a_queue.length;i++){
				//get class
				var lookForThisClass:int = a_queue[i].klass;
				//find in required array
				for(var j:int=0;j<required.length;j++){
					if(required[j] == lookForThisClass){
						//remove when found
						required.splice(j,1);
						//a_queue.splice(i,1);
						//add to returned array
						validPositions.push(i);
						if(required.length == 0){
							break;
						}
					}
				}
			}
			
			return validPositions;
		}
	}
}