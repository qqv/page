const newLocal = <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
    <View style={{ width: scaleSize(700), height: scaleSize(700), borderRadius: scaleSize(350), overflow: "hidden", transform: [{ rotate: '45deg' }], borderColor: "#CCCCCC", borderWidth: 1, }}>
        <View style={{ flexDirection: "row", height: scaleSize(350), width: "100%" }}>
            <TouchableHighlightUnit onPress={this.pressBtn.bind(this, 10)} underlayColor="#E5F4ED" backgroundColor="#FFFFFF" style={{ width: scaleSize(350), height: scaleSize(350), justifyContent: "center", alignItems: "center" }}>
                <View style={{ transform: [{ rotate: '-45deg' }] }}>
                    <Icon size={scaleSize(80)} name="up" type='antdesign' color={"#64CC7E"} />
                </View>
            </TouchableHighlightUnit>
            <TouchableHighlightUnit onPress={this.pressBtn.bind(this, 13)} underlayColor="#E5F4ED" backgroundColor="#FFFFFF" style={{ width: scaleSize(350), height: scaleSize(350), justifyContent: "center", alignItems: "center" }}>
                <View style={{ transform: [{ rotate: '-45deg' }] }}>
                    <Icon size={scaleSize(80)} name="right" type='antdesign' color={"#64CC7E"} />
                </View>
            </TouchableHighlightUnit>
        </View>
        <View style={{ flexDirection: "row", height: scaleSize(350), width: "100%" }}>
            <TouchableHighlightUnit onPress={this.pressBtn.bind(this, 12)} underlayColor="#E5F4ED" backgroundColor="#FFFFFF" style={{ width: scaleSize(350), height: scaleSize(350), justifyContent: "center", alignItems: "center" }}>
                <View style={{ transform: [{ rotate: '-45deg' }] }}>
                    <Icon size={scaleSize(80)} name="left" type='antdesign' color={"#64CC7E"} />
                </View>
            </TouchableHighlightUnit>
            <TouchableHighlightUnit onPress={this.pressBtn.bind(this, 11)} underlayColor="#E5F4ED" backgroundColor="#FFFFFF" style={{ width: scaleSize(350), height: scaleSize(350), justifyContent: "center", alignItems: "center" }}>
                <View style={{ transform: [{ rotate: '-45deg' }] }}>
                    <Icon size={scaleSize(80)} name="down" type='antdesign' color={"#64CC7E"} />
                </View>
            </TouchableHighlightUnit>
        </View>
    </View>
    <TouchableHighlightUnit onPress={this.pressBtn.bind(this, 14)} underlayColor="#E5F4ED" backgroundColor="#FFFFFF" activeOpacity={0.8} style={{ position: 'absolute', marginLeft: "auto", marginRight: "auto", marginBottom: 'auto', marginTop: "auto", width: scaleSize(350), height: scaleSize(350), justifyContent: "center", alignItems: "center", overflow: "hidden", borderRadius: scaleSize(175), borderColor: "#CCCCCC", borderWidth: 1 }}>
        <Text style={{ fontSize: setSpText(80), color: "#333333" }}>OK</Text>
    </TouchableHighlightUnit>
</View>;