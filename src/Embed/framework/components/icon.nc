<component name="icon">
    <nss>
        icon: {
            width: 20,
            height: 20,
            fontSize: 20,
            lineHeight: 20,
            color: "#000000"
        }
    </nss>
    <layout class="icon">
    </layout>
    <script>
        module.exports = class extends Component {
            constructor(attr) {
                super(attr);
                this.font = attr.data.font;

                if (attr.shape) {
                    this.shape = attr.shape;
                }

                if (!this.style.lineHeight) {
                    this.style.lineHeight = this.style.height+1;
                }

                this.on("mousedown", (e)=>{
                    /*
                    this.emit("toto", {
                        k:5,
                        m:6
                    });
                    */
                });
            }

            paint(ctx, width, height) {
                super.paint(ctx, width, height);

                var ox = 0;

                var icon = shapes[this.shape];
                let w = ctx.measureText(icon).width;

                let lineHeight  = this.inherit.lineHeight || this.style.lineHeight;
                let offset = Math.ceil(lineHeight/2);

                if (this.inherit.textAlign == "center") {
                    ox = (width-w)*0.5;
                }
                if (this.inherit.textAlign == "right") {
                    ox = (width-w);
                    console.log(width, height, w)
                }

                ctx.fontFamily    = this.font.name;
                ctx.fontSize      = this.inherit.fontSize || this.style.fontSize;
                ctx.fillStyle     = this.inherit.color || this.style.color;
                ctx.textBaseline  = "middle";
                
                ctx.fillText(icon, ox, offset);
            }
        }
    </script>
</component>
