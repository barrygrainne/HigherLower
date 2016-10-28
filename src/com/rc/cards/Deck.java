package com.rc.cards;

public class Deck {

	// properties
	private Card[] cards = new Card[52];
	private int currentCard =0; //added int value of card we are currently looking at in the array of cards
	
	
	//get & set methods
	
	public Card[] getCards() {
		return cards;
	}


	public void setCards(Card[] cards) {
		this.cards = cards;
	}
	public int getRemainingCards() {
		return cards.length - currentCard; // cards.lenght = 52
	}
	// constructor(s) //same name as the class, no return value, 
	public Deck() {

		// create an instance of each card
		int n = 0;
		for (int s=1; s<=4; s++){
			for (int v=1; v<=13; v++){
				Card c = new Card(v,s);
				cards[n++] = c;
			}
		}
		currentCard = 0;
	}
	
	
	// other methods
	public void display() {
		//TODO needs to be finished
		
	for (int i =0; i<cards.length; i++) {
		cards[i].display();
		
		if (i == 12 || i == 25 || i == 38 || i == 51) {
			System.out.println();
		}
		
	}
		
}
	public Card getCurrentCard(){
		Card card;
		
		try {
			card = cards[currentCard]; // card at element no
		} catch (ArrayIndexOutOfBoundsException ex) {
			card = null;
		} return card;
	}
	public Card getNextCard() {
		
		Card card;
		try{
			card = cards[++currentCard]; // card at current card plus 1, incrementing current card and use new value (other one i.e. currentCard ++ means incremebt after)
			} catch (ArrayIndexOutOfBoundsException ex) {
				card = null;
			} return card;
	}
	
	public void reset(){ // didn't end up using this reset
		//shuffle the deck
		
		shuffle(10000);
		//reset the currentCard to 0
		
		currentCard = 0;
	}
	public void shuffle(int n) {
		//TODO needs to be finished
		
		
		for (int i=0; i < n ; i++ ) {
		int r1 = (int)(Math.random() * 52); //0.1 to 1.0 * 51 and int should leave with no 0-51
		int r2 = (int)(Math.random() * 52);
		
		// swap the variables - need temp variable to swap
		
		Card t = cards[r1];
		cards[r1] = cards[r2];
		cards[r2] = t;

		} // end of for loop
		
	} // end of public void shuffle


	public static void main(String[] args) {
		
		System.out.println("test");
		System.out.print("this \n has \n a \n newline \n");
		
		System.out.println("a \t n \t c \t\n"); // good for columnar things
		System.out.println("xxx\tyyy\tzzz\twww\n");
		
		// TODO Auto-generated method stub
		
		Deck deck = new Deck();
		
		deck.display();
		
		deck.shuffle(1);
		
		deck.display();
		
		deck.shuffle(10);
		
		deck.display();
		
		deck.shuffle(100);
		
		deck.display();
		
		deck.shuffle(1000);
		
		deck.display();
		
		Card card;
		do {
			card = deck.getNextCard(); // test
			
			if (card != null) {
				card.display();
			}

		} while (card != null);
	
	}

}

//reloads the whole page each time