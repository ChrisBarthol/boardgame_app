import React, { useState, useEffect } from 'react'

interface Game {
    id: number;
    name: string;
    image?: string;
    year?: number;
    bgg_id: number;
}

const EmptyCollection: React.FC = () => {
    return <p>No games found. Add some games to your collection first!</p>;
};

const GameGrid: React.FC<{games: Game[]}> = ({games}) => {
    return (
        <div className="game-grid">
            {games.map(game => (
                <GameCard key={game.id} game={game} />
            ))}
        </div>
    );
};

const: GameCard: React.FC<{game: Game}> = ({game}) => {
    return (
        <div key={game.id} className="game-card">
            <p>GameImage</p>
        </div>
    )
}

const GameList: React.FC = () => {
    const [games, setGames] = useState<Game[]>([]);
    const [loading, setloading] = useState<boolean>(true);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        fetch('/api/game')
            .then(response => {
                if(!response.ok) {
                    throw new Error('Something went wrong, please try again later');
                }
                return response.json();
            })
            .then((data: Game[]) => {
                setGames(data);
                setloading(false);
            })
            .catch((error: Error) => {
                setError(error.message);
                setloading(false);
            })
    }, []);

    if (loading) return <div>Loading games...</div>;
    if (error) return <div>Error: {error}</div>;

    return (
        <div className="game-list">
            <h2>My Board Game Collection</h2>
            {games.length === 0 ? (
                <EmptyCollection />
            ) : (
                <GameGrid games={games} />
            )}
        </div>
    );
};