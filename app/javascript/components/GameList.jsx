import React, { useState, useEffect} from 'react';

const EmptyCollection = () => {
    return <p>No games found. Add some games to your collection!</p>;
};

const GameGrid = (games) => {
    return (
        <div className="game-grid">
            {games.map(game => (
                <GameCard key={game.id} game={game} />
             ))}
        </div>
    );
};

const GameCard = (game) => {
    return (
        <div key={game.id} className="game-card">
            <p> Image </p>
            <h3>{game.name}</h3>
            <p>Year: {game.year || 'Unknown'}</p>
            <p>BGG ID: {game.bgg_id || 'N/A'}</p>
        </div>
    );
};

constGameList = () => {
    const [games, setGames] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        fetch('/api/games')
          .then(response => {
            if (!response.ok) {
              throw new Error('Network response was not ok');
            }
            return response.json();
          })
          .then(data => {
            setGames(data);
            setLoading(false);
          })
          .catch(error => {
            setError(error.message);
            setLoading(false);
          });
      }, []);

      if (loading) return <div>Loading games...</div>;
      if (error) return <div>Error: {error}</div>;
}

