const express = require("express")
const fs = require("fs")
const path = require("path");
const {Client} = require("pg");

var client = new Client(
{
    database: "model",
    user: "fabian",
    password: "123456",
    host: "localhost",
    port: 5432
});

client.connect();

app = express();

app.set("view engine", "ejs");

app.use("/resurse", express.static(__dirname + "/resurse"));



app.get("/elevi", function(req, res)
{
    client.query('select * from elevi', function(err, db_res)
    {
        if(!err)
        {
            let elevi = [];

            if (req.query.id)
            {
                let ids = new Set(req.query.id.split(' ').map(id => parseInt(id)));

                for (let elev of db_res.rows)
                    if (ids.has(elev.id))
                        elevi.push(elev)
            }
            else
                elevi = db_res.rows;

            for (let elev of elevi)
            {
                let note = elev.note.split(',').map(nota => parseInt(nota.trim()));
                let medie = note.reduce((acc, nota) => acc + nota, 0) / note.length;

                elev.note = note;
                elev.medie = medie;
            }

            res.render("elevi", {elevi: elevi});
        }
        else
            console.log(err);
    });
})

app.listen(8080);
console.log("Serverul a pornit");