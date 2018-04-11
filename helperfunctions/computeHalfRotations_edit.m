        function [Rl, Rr] = computeHalfRotations_edit(this)
            r = vision.internal.calibration.rodriguesMatrixToVector(this.RotationOfCamera2');
            
            % right half-rotation
            Rr = vision.internal.calibration.rodriguesVectorToMatrix(r / -2);
            
            % left half-rotation
            Rl = Rr';
        end