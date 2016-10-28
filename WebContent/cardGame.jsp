<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page import="com.rc.cards.Deck, com.rc.cards.Card" %> <!-- this is how you import a class - use , to put in another class-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Deck deck;
Integer currentCard; // Aidan said take this out cos don't need it, mine doesn't work without this
Integer score;
Card current = null;
Card last = null;
boolean gameOver = false;


if(request.getParameter("reset") != null ) { // if someone hits the reset button this resets it
	//remove session variables
	session.removeAttribute("deck");
	session.removeAttribute("score");
	// invalidate the session - we are now removing session variables instead
	//session.invalidate();
	//response.sendRedirect("cardGame.jsp");
	
	// restart the game
	//deck.reset();
	
	//reset the score
	score = 0;

}

if (session.getAttribute("deck") == null) { 
	// this is the first time, deck isn't in the session therefore this is the first time
	
	//create deck
	deck = new Deck();
	
	// shuffle it
	deck.shuffle(10000);
	// initialise current card
	currentCard = 0; // AIdan said take this out but I need it
	current = deck.getCards()[currentCard];
	// initialise score
	score = 0;
	
	//store (all above stuff) in session object
	session.setAttribute("deck", deck);
	//session.setAttribute("currentCard", currentCard);
	session.setAttribute("score", score);
} else {
	//read deck from session
	deck = (Deck)session.getAttribute("deck");
	//read current card from session
	//currentCard = (Integer)session.getAttribute("currentCard");
	
	//read score from session
	score = (Integer)session.getAttribute("score");
	
	// what did the user say higher or lower
	boolean higher;
	if (request.getParameter("higher") != null) {
		// they said higher
		higher = true;
	} else {
		// they said lower
		higher = false;
	}
	// increment currentCard
	//currentCard = new Integer(currentCard.intValue() + 1);
	
		// what was the last card
	last = deck.getCurrentCard();
		// increment current card
	current = deck.getNextCard();

	//last = deck.getCards()[currentCard.intValue()-1];
	
	
	// what is the current card
	//current = deck.getNextCard();
	if (current == null) {
		gameOver = true;
		
	} else {
	
	// were they right or wrong
	if (current.compare(last) == 0){
		//do nothing
	} else if(higher && current.compare(last) == 1) {
		score = score +1;
	} else if(higher == false && current.compare(last) == -1) {
		score = score +1;
	} else {
		score = score -1;
	}
	}
	// store currentCard and score in session
	//session.setAttribute("currentCard", currentCard); // dont need this as it is now stored in the deck
	session.setAttribute("score", score); //save the score
	session.setAttribute("deck", deck); // save the deck

} 
// all before this run before the html

// &nbsp wont cause a new line character
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="CSS/cards.css" type="text/css">
</head>
<body>

<h1>Higher Lower </h1>
<p>Score:<%=score%> &nbsp; Remaining cards:<%=deck.getRemainingCards() %> </p> 


<form action="cardGame.jsp" method="get">

<!--  need to initialise variables before can use by reading them from session -->
 


<br>
<div id="cardTable">
	

<% if (gameOver) { %>
<h1>GAME OVER!</h1>
<% 
} else
{ %>
<% if (last == null){ %>

<%=current.displayAsImage() %> <br>

<% } else { %>
<%=current.displayAsImage() %> <br>
<%=last.displayAsImage() %> <br>
<% } %>
<% } %>

<input type="submit" name ="higher" value ="higher">
<input type="submit" name ="lower" value ="lower">
<br>
<br>

<input type="submit" name ="reset" value ="reset">


</div>
</form>
</body>
</html>