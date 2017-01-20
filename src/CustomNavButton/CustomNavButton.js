import React, {PropTypes} from 'react';
import { requireNativeComponent, NativeModules } from 'react-native';

export default class CustomNavButton extends React.Component {

    constructor(props) {
        super(props);
    }

    componentWillUnmount() {
        NativeModules.RNNCustomNavButtonManager.destroyButtonWithId(this.props.buttonId)
    }

    render() {
        return (<RNNCustomNavButton {...this.props}/>);
    }
}

CustomNavButton.propTypes = {
    buttonId: PropTypes.string,
};

var RNNCustomNavButton = requireNativeComponent(
    'RNNCustomNavButton',
    CustomNavButton
);