import React, {Component} from 'react';
import Kin from './kinjonsquad.jpg';
import Like from './gostar.png';
import User from './user.png';
import Share from './share.png';
import Comentario from './comentario.png';



class Lista extends Component {
    constructor(props){
        super(props);
        this.state = {
            nome: 'Kin Jon-Un',
            feed: [
                {id: 0, username: 'Serginho do Berrante', curtidas: 256, comentarios: 100, compartilhamentos: 12},
            ]    
        }
    }
    render() { 
        return (  
            <div className="janela">
                {
                    this.state.feed.map(item => {
                        return (
                            <div key={item.id}>
                                <hr></hr>
                                <br></br>
                                <div className="User"><img src={User} alt="gostar" width="50"/></div>
                                <h1>{item.username}</h1>

                                <img src={Kin} alt="kinjonsquad"/>
                                
                                <table>
                                  <tr>
                                    <br></br>
                                    
                                    <div className="like"><img src={Like} alt="gostar" width="19"/></div>
                                    <td><h3> {item.curtidas} Curtidas | </h3></td>
                                    
                                    <br></br>
                                    <div className="comentario"><img src={Comentario} alt="comentario" width="30"/></div>

                                    <br></br>
                                    <td><h3> {item.comentarios} Comentários | </h3></td><hr></hr>
                                    
                                    <div className="share"><img src={Share} alt="Share" width="35"/></div>

                                    <br></br>
                                    <td><h3> {item.compartilhamentos} Compartilhamentos </h3></td>
                                    
                                    <br></br>

                                  <hr/>

                                  </tr>
                                

                                </table>
                                

                            </div>
                        )
                    })
                }
            </div>
        );
    }
}
 
export default Lista;
